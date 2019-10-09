import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { RegistroItemPage } from './registro-item.page';

describe('RegistroItemPage', () => {
  let component: RegistroItemPage;
  let fixture: ComponentFixture<RegistroItemPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ RegistroItemPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(RegistroItemPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
