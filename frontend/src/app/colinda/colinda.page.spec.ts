import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ColindaPage } from './colinda.page';

describe('ColindaPage', () => {
  let component: ColindaPage;
  let fixture: ComponentFixture<ColindaPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ColindaPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ColindaPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
