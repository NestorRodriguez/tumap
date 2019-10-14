import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { HidricaPage } from './hidrica.page';

describe('HidricaPage', () => {
  let component: HidricaPage;
  let fixture: ComponentFixture<HidricaPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ HidricaPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(HidricaPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
