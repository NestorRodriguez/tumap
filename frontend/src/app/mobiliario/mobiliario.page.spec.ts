import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MobiliarioPage } from './mobiliario.page';

describe('MobiliarioPage', () => {
  let component: MobiliarioPage;
  let fixture: ComponentFixture<MobiliarioPage>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MobiliarioPage ],
      schemas: [CUSTOM_ELEMENTS_SCHEMA],
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MobiliarioPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
